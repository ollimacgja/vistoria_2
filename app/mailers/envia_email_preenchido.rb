class EnviaEmailPreenchido < ApplicationMailer
#chamada EnviaEmailPreenchido.formulario(form_p, @form, @emails).deliver_later    
    
    def formulario(form_p, formulario, emails)
     @form_p = form_p
     @formulario = formulario
     @destinos = emails
        #mail(to: @destinos, subject: "Vistocorp - #{formulario.formulario.nome} - #{formulario.id} registrado(a)")
    mail(to: @destinos, subject: "Vistocorp #{@formulario.nome} ##{@form_p.id} registrado(a)")
    end

end
