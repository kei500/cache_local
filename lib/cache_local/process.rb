module CacheLocal
  class Process
    def initialize(namespace = nil)
      @namespace = namespace
      @cache = {@namespace => {}}
    end

    def set(key, value, expiration_time = 0)
      @cache[@namespace][key] = {value: value, expiration_time: expiration_time, set_time: Time.now}
    end

    def get(key)
      return nil unless @cache[@namespace][key]

      if expired?(key)
        delete(key)
        return nil
      end

      @cache[@namespace][key][:value]
    end

    def delete(key)
      @cache[@namespace].delete(key)
    end

    private

    def expired?(key)
      return false if @cache[@namespace][key][:expiration_time] == 0
      Time.now - @cache[@namespace][key][:set_time] > @cache[@namespace][key][:expiration_time]
    end
  end
end
