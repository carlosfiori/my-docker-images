FROM adrianharabula/php7cli-with-oci8
RUN mkdir /root/app
WORKDIR /root/app
EXPOSE 8000

RUN echo "---> Installing Composer" && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ]