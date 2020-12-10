class UserMailer < ApplicationMailer
    default from: 'no-reply-to-kasu@yopmail.com'
   
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://monsite.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def match_email(user, library_item)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        #@user = user
        @email = user.email
        
        @item = library_item
        @username = user.name

        # # #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'https://kasu-develop.herokuapp.com' 
      
        # # # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @email, subject: 'Ta commande sur e-chaton.fr !') 
    end

    def contact(name, email, message)
      @user_name = name
      @user_mail = email
      @message = message

      mail(to: 'kasu@yopmail.com', subject: user_name )
    end
end
