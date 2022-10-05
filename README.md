# Wanna go out?
"Wanna go out?" is a stylish event manager that allows you to organize the events you want or participate in your friends' events.

### Mechanics
You launch the application. Then you can sign ap or log-in with github AUTH or google AUTH. After this you can manage any events and invite your friends in it

### Photos
- Start page
![Screenshot from 2022-10-05 18-51-48](https://user-images.githubusercontent.com/83035520/194110033-6d2184bd-c4f8-4a98-b59e-34964a06283f.png)

- Log-in page
![Screenshot from 2022-10-05 18-37-23](https://user-images.githubusercontent.com/83035520/194110175-e39d2276-ed7b-4a73-9931-f641c85dcfa9.png)


- some amazing event
![Screenshot from 2022-10-05 18-52-06](https://user-images.githubusercontent.com/83035520/194110227-829627c4-c7d2-4863-b496-f239dc55b6e4.png)

![Screenshot from 2022-10-05 18-52-20](https://user-images.githubusercontent.com/83035520/194110320-c53dec44-50ed-41e7-ac3b-b95e568d65af.png)

![Screenshot from 2022-10-05 19-09-59](https://user-images.githubusercontent.com/83035520/194110435-a6df2bb8-99f6-45a0-8f5d-cdca19a875e9.png)

- Comments section
![Screenshot from 2022-10-05 19-09-02](https://user-images.githubusercontent.com/83035520/194110403-a8e6a528-eb79-4985-92c5-dbb268764f3e.png)

- User page
![Screenshot from 2022-10-05 18-53-00](https://user-images.githubusercontent.com/83035520/194110484-daabe00b-7b62-4e6a-873d-3a73bc2aeeba.png)

#### Features

- Pincode guard for private events
![Screenshot from 2022-10-05 19-11-54](https://user-images.githubusercontent.com/83035520/194110746-739e580a-e6c3-4f54-839c-1891627bab07.png)

- Antispam
![Screenshot from 2022-10-05 19-19-36](https://user-images.githubusercontent.com/83035520/194111234-aa2f39cf-038f-4d6b-876b-d965505aece1.png)

- Full postal coverage of any actions with the event. You won't miss any new photos or subscriptions to your event.

### To start

- **WARNING**: This app uses many secret api keys for sending emails, checking captcha etc. You need to ask [owner](https://t.me/Grishchenko1) for `master.key` to this app and include it in config folder
- You should have installed ruby(3.0.2) on your pc(how to do this - [here](https://www.ruby-lang.org/en/documentation/installation/))

1. Download all files to single folder
2. Open CMD
3. Open program directory in CMD
4. Install all the gems (libraries) required by the application by entering these commands in CMD:
```
gem install bundler
bundle install
```
5. Insert master.key(check above) in config folder
6. Run migrations
```
bundle exec rails db:migrate
```
7. install webpacker
```
bundle exec rails webpacker:install
```
8. Launch app by entering this(you are in program directory already)
```
bundle exec rails s
```
9. That's all. Now you can use it, just go to 'http://localhost:3000/'

### P.s
This is my RoR study project that I created during  [good programmer course](https://goodprogrammer-ru.translate.goog/rails?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp)

#### What have I learned during developing this app?
- Bootstrap 5
- Webpacker
- Sessions, authentication, devise gem
- localization, I18n
- nested resources
- file uploading, carrierwave gem
- Mailers, ActionMailer

## RUS

# Wanna go out?
"Wanna go out?" - это стильный менеджер мероприятий, который позволяет вам организовывать мероприятия, которые вы хотите, или участвовать в событиях ваших друзей.

### Механика
Вы запускаете приложение. Затем вы можете зарегистрироваться или войти в систему с помощью github AUTH или google AUTH. После этого вы сможете управлять любыми мероприятиями и приглашать на них своих друзей

### Photos
- Стартовая страница
![Screenshot from 2022-10-05 18-51-48](https://user-images.githubusercontent.com/83035520/194110033-6d2184bd-c4f8-4a98-b59e-34964a06283f.png)

- Страница входа
![Screenshot from 2022-10-05 18-37-23](https://user-images.githubusercontent.com/83035520/194110175-e39d2276-ed7b-4a73-9931-f641c85dcfa9.png)


- Какое то интересное событие
![Screenshot from 2022-10-05 18-52-06](https://user-images.githubusercontent.com/83035520/194110227-829627c4-c7d2-4863-b496-f239dc55b6e4.png)

![Screenshot from 2022-10-05 18-52-20](https://user-images.githubusercontent.com/83035520/194110320-c53dec44-50ed-41e7-ac3b-b95e568d65af.png)

![Screenshot from 2022-10-05 19-09-59](https://user-images.githubusercontent.com/83035520/194110435-a6df2bb8-99f6-45a0-8f5d-cdca19a875e9.png)

- Секция комментариев
![Screenshot from 2022-10-05 19-09-02](https://user-images.githubusercontent.com/83035520/194110403-a8e6a528-eb79-4985-92c5-dbb268764f3e.png)

- Страница пользователя
![Screenshot from 2022-10-05 18-53-00](https://user-images.githubusercontent.com/83035520/194110484-daabe00b-7b62-4e6a-873d-3a73bc2aeeba.png)

#### Особенности

- Пинкод защита для приватных событий
![Screenshot from 2022-10-05 19-11-54](https://user-images.githubusercontent.com/83035520/194110746-739e580a-e6c3-4f54-839c-1891627bab07.png)

- Защита от спама
![Screenshot from 2022-10-05 19-19-36](https://user-images.githubusercontent.com/83035520/194111234-aa2f39cf-038f-4d6b-876b-d965505aece1.png)

- Полное покрытие почтовой отправкой любых действий с событием. Вы не пропустите ни одной новой фотографии или подписки на ваше событие.

### To start

- **ВАЖНО**: Это приложение использует множество секретных ключей api для отправки электронных писем, проверки капчи и т.д. Вам нужно спросить [владельца](https://t.me/Gryshchenko1 ) файл `master.key` к этому приложению и включить его в папку config
- Вы должны иметь установленный ruby(3.0.2) на своём компьютере(как это сделать - [здесь](https://www.ruby-lang.org/en/documentation/installation /))

1. Скачайте все файлы в одну папку
2. Откройте командную строку
3. Откройте директорию с программой в командной строке
4. Установите все гемы(библиотеки) необходимые для работы введя это
```
gem install bundler
bundle install
```
5. Вставьте master.key(смотри выше) в config папку
6. Прогоните миграции
```
bundle exec rails db:migrate
```
7. Скачайте вебпакер
```
bundle exec rails webpacker:install
```
8. Запустите приложение(вы уже в программной директории через командную строку)
```
bundle exec rails s
```
9. Всё. Теперь можете просто перейти по этой ссылке 'http://localhost:3000/'

### P.s
Это мой учебный проект, который я делал во время прохождения [good programmer курса](https://goodprogrammer.ru/rails)

#### Что я изучил разрабатывая это приложение?
- Bootstrap 5
- Webpacker
- Сессии, аутентификация, devise гем
- локализация, I18n
- вложенные ресурсы
- загрузка файлов, carrierwave гем
- Mailers, ActionMailer
