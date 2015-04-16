require 'fileutils'

module CacheLocal
  class File
    def initialize(path, namespace = nil)
      @path = path
      @namespace = namespace
      if namespace
        FileUtils.mkdir_p(::File.join(path, namespace)) unless FileTest.exist?(::File.join(path, namespace))
      end
    end

    def set(key, value, expiration_time = 0)
      file = ::File.open(filename(key), 'w')
      Marshal.dump({value: value, expiration_time: expiration_time}, file)
      file.close
    end

    def get(key)
      return nil unless ::File.exists?(filename(key))

      file = ::File.open(filename(key), 'r')
      cache = Marshal.load(file)
      is_expired = cache[:expiration_time] != 0 && Time.now - file.mtime > cache[:expiration_time]
      file.close

      if is_expired
        delete(key)
        return nil
      end

      cache[:value]
    end

    def delete(key)
      ::File.delete(filename(key)) if ::File.exists?(filename(key))
    end

    private

    def filename(key)
      @namespace ? ::File.join(@path, @namespace, key) : ::File.join(@path, key)
    end
  end
end
