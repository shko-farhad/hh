mkdir my_project 
cd my_project 
FROM python:3.9-slim 
WORKDIR /usr/src/app 
RUN pip install --no-cache-dir flask 
COPY . . 
EXPOSE 5000 
CMD ["python", "app.py"] 
==================================== 
docker build -t flask-app:v1.0 . 
docker images 
docker run -d --name my-web-app -p 8080:5000 flask-app:v1.0 
docker run -d --name my-web-app -p 8080:5000 -v flask-data:/usr/src/app flask-app:v1.0 
===================================  )Pull( هێنانەخوارەوەی .١ 
# سێرڤەر
ی
docker pull nginx:alpine 
# ٢.  بوو
ەداونلۆ
دسەرکەوتوویی
بە
ئیمێجی
ئیمێجەکە

docker images 
Nginx ک
ەئەوەی
پشکنینی

  پۆرت  بەستنی و پشتەوە لە  دەستبەجێ شێوازی بە سێرڤەرەکە کانتێنەری ڕاکردنی .٣ 
#
docker run -d --name test-server -p 80:80 nginx:alpine 
  کارکردنی  لە دڵنیابوون و کانتێنەرەکە دۆخی پشکنینی .٤ 
#
docker ps 
  کاتی  شێوەیەکی بە سێرڤەرەکە کانتێنەری ڕاگرتنی .٥ 
#
docker stop test-server 
  هۆستەکە  لەسەر کانتێنەرەکە تەواوەتی سڕینەوەی .٦ 
#
docker rm test-server 
  کۆتایی پاککردنەوەی بۆ ئەسڵییەکە  ئیمێجی خودی سڕینەوەی .٧ 
#
docker rmi nginx:alpine 
 
 ===================  داتابەیسەکە  بە تایبەت ڤۆلیۆمی دروستکردنی .١ 
#
docker volume create mysql_university_data 
  ڤۆلیۆمەکەوە  بە بەستنەوەی و پاسۆرد بە MySQL داتابەیسی ڕاکردنی .٢ 
#
docker run -d --name uni_db_server -e MYSQL_ROOT_PASSWORD=student123 -v 
mysql_university_data:/var/lib/mysql mysql:latest 
  ڕاکراوەکەدا  کانتێنەرە ناو لە MySQL شێڵی ناو چوونە .٣ 
#
docker exec -it uni_db_server mysql -u root -pstudent123 
