# CacheLocal
[![Gem Version](https://badge.fury.io/rb/cache_local.png)](http://badge.fury.io/rb/cache_local)  
CacheLocal provides very simple cache function. There are two types of cache: file cache and process cache.

## Installation

Add this line to your application's Gemfile:

    gem 'cache_local'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cache_local

## Usage
### File Cache
```ruby
require 'cache_local'

file_cache = CacheLocal::File.new(path_to_cache_directory, namespace) 
file_cache.set(key, value)
file_cache.get(key)
file_cache.delete(key)
file_cache.set(key, value, expiration_time) # enable to specify expiration time [sec]
```

### Process Cache
```ruby
require 'cache_local'

process_cache = CacheLocal::Process.new(namespace)
process_cache.set(key, value)
process_cache.get(key)
process_cache.delete(key)
process_cache.set(key, value, expiration_time) # enable to specify expiration time [sec]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
