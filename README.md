# Практическая работа 11

### Инструкция по развертыванию приложения через kubectl

- Применение всех манифестов: `kubectl apply -f manifests/`
- Проверка: `kubectl get pods`
- Для просмотра подробной информации о pod: `kubectl describe pod <POD_NAME>`
- Получение внешнего IP (Ingress): `kubectl get ingress`. Используйте EXTERNAL IP для проверки работы приложения.
- Проверка работы приложения: 

  `curl http://<EXTERNAL_IP>/`

  `curl http://<EXTERNAL_IP>/api`

  `curl -i http://<EXTERNAL_IP>/health`
- Обновление конфигурации: `kubectl apply -f manifests/`
- Удаление приложения: `kubectl delete -f manifests/`

### Инструкция по развертыванию приложения через Helm

- Создание и упаковка Helm Chart: `helm create my-web-app`
- Параметры развертывания задаются в файле `values.yaml`
- Установка приложения в namespace production: `helm install my-release ./my-web-app -n production --create-namespace`
- Проверка: `kubectl get pods -n production`
- Получение внешнего IP (Ingress): `kubectl get ingress`. Используйте EXTERNAL IP для проверки работы приложения.
- Проверка работы приложения:

    `curl http://<EXTERNAL_IP>/`   

    `curl http://<EXTERNAL_IP>/api`

    `curl -i http://<EXTERNAL_IP>/health`
- Обновление конфигурации (например, количество реплик): изменить значения в values.yaml (например, frontend.replicaCount)
- Применяем обновление: `helm upgrade my-release ./my-web-app -n production`
- Проверяем изменения: `kubectl get pods -n production`
- Удаление развернутого приложения: `helm uninstall my-release -n production`