### Install Nginx
sudo dnf install -y nginx
sudo systemctl enable --now nginx

# nginx reverse proxy
vim /etc/nginx/conf.d/k3s-grafana.conf
: << "END"
server {
    listen 32000;
    server_name k3s-host;

    location / {
        proxy_pass http://45.120.120.113:32000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        # CORS 허용 설정
        add_header Access-Control-Allow-Origin *;
        add_header Access-Control-Allow-Methods "GET, POST, OPTIONS, PUT, DELETE";
        add_header Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept, Authorization";

        # OPTIONS 요청 응답 처리
        if ($request_method = OPTIONS) {
            add_header Content-Length 0;
            add_header Content-Type text/plain;
            return 204;
        }
    }
}
END

# firewall configuration
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
