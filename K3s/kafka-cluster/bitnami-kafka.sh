# Bitnami는 VMware Tanzu에서 관리하는 오픈소스 애플리케이션 카탈로그로,
# 다양한 OSS를 보안과 호환성 측면에서 검증된 컨테이너 이미지·가상머신·Helm 차트 형태로 바로 동작 가능한 패키지로 제공

# Bitnami의 퍼블릭 Helm 차트 저장소를 등록하면
# bitnami/kafka 차트를 통해 Kafka 클러스터를 위한 Kubernetes 리소스 템플릿과 권장 설정값을 자동으로 가져와 간편하게 배포·관리 가능
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# kafka를 위한 네임스페이스 생성
kubectl create ns kafka

# bitnami/kafka 버전 확인
helm search repo bitnami/kafka --versions

# 메모리 절약과 ZK 모드를 사용하기 위해 28.3.0으로 다운그레이드하여 설치
helm install kafka bitnami/kafka \
  --version 28.3.0 \
  -f kafka-values.yaml \
  -n kafka
