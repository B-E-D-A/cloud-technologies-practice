# Практическая работа №8

Инфраструктура включает:
- Облачную сеть и подсеть
- Виртуальную машину с cloud-init
- Объектное хранилище с сервисным аккаунтом и статическим ключом
- СУБД (YDB Serverless)
- Настройку прав доступа для сервисного аккаунта

Конфигурация Terraform разбита на модули:
- `network` — создание VPC и подсетей
- `instances` — создание VM и дисков с cloud-init
- `db` — создание YDB и объекта для хранения данных с сервисным аккаунтом

Для развертывания:
1. Создать файл `terraform.tfvars` с параметрами окружения (`yc_token`, `cloud_id`, `folder_id`, `zone`, `name_prefix`).

2. Инициализировать Terraform:
```bash
terraform init
```
3. Просмотреть план изменений:
```bash
terraform plan -var-file="terraform.tfvars"
```

4. Применить конфигурацию:
```bash
terraform apply -var-file="terraform.tfvars"
```

После успешного развертывания доступны outputs:
- ID сети и подсети
- ID VM и диска
- Имя bucket и ID сервисного аккаунта
- Имя и endpoint YDB Serverless