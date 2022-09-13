class User < ActiveRecord::Base
    belongs_to :skatepark
    belongs_to :category

    class EmailError < StandardError
        def message
            "Email not found."
        end
    end

    class PasswordError < StandardError
        def message
            "Email/password mismatch."
        end
    end

    def self.validate_user email, password
        @user = User.find_by(email: email)
        if @user
            # @validateduser = User.find_by(email: email, password: password)
            if @user.password === password
                return @user
            else
                begin
                    raise PasswordError
                rescue PasswordError => error
                    return error.message
                end
            end
        else
            begin
                raise EmailError
            rescue EmailError => error
                return error.message
            end   
        end
    end

end