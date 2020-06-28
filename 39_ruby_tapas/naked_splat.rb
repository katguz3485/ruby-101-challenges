# require 'net/http'
#
# class CachedHTTP < Net::HTTP
#   def initialize
#     @cache = {}
#     super
#   end
#
#   def request
#     super
#     # ...store result in the cache...
#   end
# end

require 'net/http'

# class CachedHTTP < Net::HTTP
#   def initialize(
#       address,
#       port   = nil,
#       p_addr = :ENV,
#       p_port = nil,
#       p_user = nil,
#       p_pass = nil)
#     @cache = {}
#     super(address, port, p_addr, p_port, p_user, p_pass)
#   end
#
#   def request
#     super
#     # ...store result in the cache...
#   end
# end

#
# class CachedHTTP < Net::HTTP
#   def initialize(
#       address,
#       port   = nil,
#       p_addr = :ENV,
#       p_port = nil,
#       p_user = nil,
#       p_pass = nil)
#     @cache = {}
#     super
#   end
#
#   def request
#     super
#     # ...store result in the cache...
#   end
# end
# class CachedHTTP < Net::HTTP
#   def initialize(*args)
#     @cache = {}
#     super
#   end
#
#   def request
#     super
#     # ...store result in the cache...
#   end
# end
# class CachedHTTP < Net::HTTP
#   def initialize(*)
#     @cache = {}
#     super
#   end
#
#   def request
#     super
#     # ...store result in the cache...
#   end
# end
# class CachedHTTP < Net::HTTP
#   def initialize(*)
#     @cache = {}
#     super
#   end
#
#   def request(request, *)
#     super
#     # ...store result in the cache...
#   end
# end