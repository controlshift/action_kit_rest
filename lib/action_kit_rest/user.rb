module ActionKitRest
  class User < Base
    def base_path
      'user'
    end

    def get(id)
      user = super(id)

      # Perform a second request to retrieve user's phones data if any available
      # (user.phones attribute includes the path for associated phones, not the data itself)
      if user.id.present? && user.phones.any?
        phones_list = client.phone.list(user: user.id)
        user.obj.phones = phones_list.obj.to_a
      end

      user
    end
  end
end