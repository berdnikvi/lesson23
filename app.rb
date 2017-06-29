#encoding: utf-8
#
# +  1. Добавить post-обработчик для visit
# +  2. Добавить все введенные данные в public/users.txt
# +  3. Добавить страницу /contacts со следующими полями:
#        3.1 email
#        3.2 сообщение (посмотреть html-элемент textarea)
#        http://getbootstrap.com/css/#forms
# +  4. Все сохраненные контакты должны добавляться в /public/contacts.txt
#
#    5. На странице /visit пользователь должен иметь возможность выбрать
#        парикмахера из списка
#         Вася
#         Петя
#         Даша
#       Необходимо использовать html-контрол select
#    6. Введенные данные должны сохраняться в тот же файл.
#
#    7. Сделать вход по логину и паролю через bootstrap (как в уроке 21).
#
#
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do
  @username  = params[:username]
  @phone     = params[:phone]
  @datetime  = params[:datetime]

  @title = 'Thank you:'
  @msg = "Dear #{@username}, we'll be waiting for you at #{@datetime} "

  f = File.open('./public/users.txt','a')
  f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}"\
    +"Master: #{@master}"
  f.close
  erb :visit

end

post '/contacts' do
  @email = params[:email]
  @text  = params[:text]

  f = File.open('./public/contacts.txt','a')
  f.write "email: #{@email}, Text: #{@text}"
  f.close
  erb :contacts
end
