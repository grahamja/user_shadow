class Chef
  class Resource
    class UserShadow < Chef::Resource
      provides :user_shadow

      def initialize(name, run_context = nil)
        super
        @resource_name = :user_shadow
        @user = @name
        @allowed_actions = :set
        @action = :set
        @chage = '/usr/bin/chage'
        @sp_lstchg, @sp_expire, @sp_min, @sp_max, @sp_warn, @sp_inact = nil
      end

      def user(arg = nil)
        set_or_return(:user, arg, kind_of: String)
      end

      def chage(arg = nil)
        set_or_return(:chage, arg, kind_of: String)
      end

      def sp_lstchg(arg = nil)
        set_or_return(
          :sp_lstchg,
          arg,
          kind_of: String,
          regex: [
            /^\d{1,5}$/,
            /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/,
          ]
        )
      end

      def sp_expire(arg = nil)
        set_or_return(
          :sp_expire,
          arg,
          kind_of: [String, Integer],
          regex: [
            /^\d{1,5}$/,
            /^-1$/,
            /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/,
          ]
        )
      end

      def sp_min(arg = nil)
        set_or_return(
          :sp_min,
          arg,
          kind_of: [String, Integer],
          regex: [/^\d{1,5}$/]
        )
      end

      def sp_max(arg = nil)
        set_or_return(
          :sp_max, arg,
          kind_of: [String, Integer],
          regex: [/^\d{1,5}$/, /^-1$/]
        )
      end

      def sp_warn(arg = nil)
        set_or_return(
          :sp_warn,
          arg,
          kind_of: [String, Integer],
          regex: [/^\d{1,5}$/]
        )
      end

      def sp_inact(arg = nil)
        set_or_return(
          :sp_inact,
          arg,
          kind_of: [String, Integer],
          regex: [/^\d{1,5}$/, /^-1$/]
        )
      end
    end
  end
end
# rubocop:enable Documentation
