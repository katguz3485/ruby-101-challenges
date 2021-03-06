#related with set.rb

avdi_list = %w[milk granola cookies apples]
stacey_list = %w[milk banana eggs]
shopping_list = avdi_list + stacey_list
shopping_list.uniq!

avdi_list | stacey_list
avdi_list & stacey_list

avdi_list = %W[milk granola cookies apples]
stacey_list = %W[milk bananas eggs apples]
avdi_list - stacey_list #  => ["granola", "cookies"]

stacey_list - avdi_list #  ["bananas", "eggs"]
avdi_list & stacey_list
# => ["milk", "apples"]
#
#
require 'uri'

URI::HTTP.instance_methods
# => [:request_uri,
#     :default_port,
#     :scheme,
#     :host,
#     :port,
#     :registry,
#     :path,
#     :query,
#     :opaque,
#     :fragment,
#     :parser,
#     :component,
#     :set_scheme,
#     :scheme=,
#     :userinfo=,
#     :user=,
#     :password=,
#     :set_userinfo,
#     :set_user,
#     :set_password,
#     :userinfo,
#     :user,
#     :password,
#     :set_host,
#     :host=,
#     :hostname,
#     :hostname=,
#     :set_port,
#     :port=,
#     :set_registry,
#     :registry=,
#     :set_path,
#     :path=,
#     :set_query,
#     :query=,
#     :set_opaque,
#     :opaque=,
#     :set_fragment,
#     :fragment=,
#     :hierarchical?,
#     :absolute?,
#     :absolute,
#     :relative?,
#     :merge!,
#     :merge,
#     :+,
#     :route_from,
#     :-,
#     :route_to,
#     :normalize,
#     :normalize!,
#     :to_s,
#     :==,
#     :hash,
#     :eql?,
#     :component_ary,
#     :select,
#     :inspect,
#     :coerce,
#     :find_proxy,
#     :pretty_print,
#     :pretty_print_cycle,
#     :pretty_print_instance_variables,
#     :pretty_print_inspect,
#     :nil?,
#     :===,
#     :=~,
#     :!~,
#     :<=>,
#     :class,
#     :singleton_class,
#     :clone,
#     :dup,
#     :taint,
#     :tainted?,
#     :untaint,
#     :untrust,
#     :untrusted?,
#     :trust,
#     :freeze,
#     :frozen?,
#     :methods,
#     :singleton_methods,
#     :protected_methods,
#     :private_methods,
#     :public_methods,
#     :instance_variables,
#     :instance_variable_get,
#     :instance_variable_set,
#     :instance_variable_defined?,
#     :remove_instance_variable,
#     :instance_of?,
#     :kind_of?,
#     :is_a?,
#     :tap,
#     :send,
#     :public_send,
#     :respond_to?,
#     :extend,
#     :display,
#     :method,
#     :public_method,
#     :define_singleton_method,
#     :object_id,
#     :to_enum,
#     :enum_for,
#     :pretty_inspect,
#     :equal?,
#     :!,
#     :!=,
#     :instance_eval,
#     :instance_exec,
#     :__send__,
#     :__id__]
URI::HTTP.instance_methods(false)
# => [:request_uri]
URI::Generic.instance_methods(false)
# => [:default_port,
#     :scheme,
#     :host,
#     :port,
#     :registry,
#     :path,
#     :query,
#     :opaque,
#     :fragment,
#     :parser,
#     :component,
#     :set_scheme,
#     :scheme=,
#     :userinfo=,
#     :user=,
#     :password=,
#     :set_userinfo,
#     :set_user,
#     :set_password,
#     :userinfo,
#     :user,
#     :password,
#     :set_host,
#     :host=,
#     :hostname,
#     :hostname=,
#     :set_port,
#     :port=,
#     :set_registry,
#     :registry=,
#     :set_path,
#     :path=,
#     :set_query,
#     :query=,
#     :set_opaque,
#     :opaque=,
#     :set_fragment,
#     :fragment=,
#     :hierarchical?,
#     :absolute?,
#     :absolute,
#     :relative?,
#     :merge!,
#     :merge,
#     :+,
#     :route_from,
#     :-,
#     :route_to,
#     :normalize,
#     :normalize!,
#     :to_s,
#     :==,
#     :hash,
#     :eql?,
#     :component_ary,
#     :select,
#     :inspect,
#     :coerce,
#     :find_proxy]
URI::HTTP.instance_methods - Object.instance_methods
# => [:request_uri,
#     :default_port,
#     :scheme,
#     :host,
#     :port,
#     :registry,
#     :path,
#     :query,
#     :opaque,
#     :fragment,
#     :parser,
#     :component,
#     :set_scheme,
#     :scheme=,
#     :userinfo=,
#     :user=,
#     :password=,
#     :set_userinfo,
#     :set_user,
#     :set_password,
#     :userinfo,
#     :user,
#     :password,
#     :set_host,
#     :host=,
#     :hostname,
#     :hostname=,
#     :set_port,
#     :port=,
#     :set_registry,
#     :registry=,
#     :set_path,
#     :path=,
#     :set_query,
#     :query=,
#     :set_opaque,
#     :opaque=,
#     :set_fragment,
#     :fragment=,
#     :hierarchical?,
#     :absolute?,
#     :absolute,
#     :relative?,
#     :merge!,
#     :merge,
#     :+,
#     :route_from,
#     :-,
#     :route_to,
#     :normalize,
#     :normalize!,
#     :component_ary,
#     :select,
#     :coerce,
#     :find_proxy]
#
avdi_list = %W[milk granola cookies apples]
avdi_list << "granola"
avdi_list << "ice cream"
avdi_list

avdi_list = %W[milk granola cookies apples]
avdi_list |= ["granola"]
avdi_list |= ["banana"]
avdi_list

avdi_list = %W[milk granola cookies apples]
original_list = avdi_list
avdi_list |= ["granola"]
avdi_list |= ["ice cream"]
avdi_list
# => ["milk", "granola", "cookies", "apples", "ice cream"]
original_list
# => ["milk", "granola", "cookies", "apples"]