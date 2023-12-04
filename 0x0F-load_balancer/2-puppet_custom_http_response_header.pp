# Automating 0-custom_http_response_header task
package {'nginx':
  ensure => installed
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
server {
        listen          80 default_server;
        listen          [::]:80 default_server;

        root            /var/www/html;
        index           index.html index.htm index.nginx-debian.html;

        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=TfgBHC5gvTI;
	}

	error_page 404 /404.html;
	location /404 {
        	root /var/www/html/;
        	internal;
    	}
}
",
  notify  => Service['nginx'],
}

file { '/etc/nginx/sites-enabled/default':
  ensure => 'link',
  target => '/etc/nginx/sites-available/default',
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}
