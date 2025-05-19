# Repo Clone
git clone https://github.com/timfanda35/simple-k6.git
cd simple-k6

# Docker 이미지 빌드, Push
docker build -t judemin/simple-k6:latest .
docker push judemin/simple-k6:latest