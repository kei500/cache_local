$: << File.expand_path(File.join(__FILE__, '..', '..', '..', 'lib'))
require 'cache_local'

describe CacheLocal::Process do
  before do
    @cache = CacheLocal::Process.new('cache_local')
  end

  describe '#get' do
    describe "when expiration_time isn't set" do
      before do
        @cache.set('key', 'value')
      end
      it "returns 'value' when key exists" do
        expect(@cache.get('key')).to eq('value')
      end

      it "returns nil when key dosen't exist" do
        expect(@cache.get('hoge')).to eq(nil)
      end
    end

    describe "when expiration_time is set" do
      before do
        @cache.set('key', 'value', 1)
      end
      it "returns 'value' when key isn't expired" do
        expect(@cache.get('key')).to eq('value')
      end

      it "returns nil when key is expired" do
        sleep(1)
        expect(@cache.get('key')).to eq(nil)
      end
    end
  end

  describe '#delete' do
    before do
      @cache.set('key', 'value')
    end

    it 'returns nil when key is deleted' do
      @cache.delete('key')
      expect(@cache.get('key')).to eq(nil)
    end
  end
end
