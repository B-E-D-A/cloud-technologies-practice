# Практическая работа 11

### Инструкция по развертыванию приложения через kubectl

- Применение всех манифестов: `kubectl apply -f manifests/`
- Проверка: `kubectl get pods`
- Для просмотра подробной информации о pod: `kubectl describe pod <POD_NAME>`
- Получение внешнего IP (Ingress): `kubectl get ingress`. Используйте EXTERNAL IP для проверки работы приложения.
- Проверка работы приложения: `curl http://<EXTERNAL_IP>/`, `curl http://<EXTERNAL_IP>/api`, `curl -i http://<EXTERNAL_IP>/health`


- Обновление конфигурации: `kubectl apply -f manifests/`
- Удаление приложения: `kubectl delete -f manifests/`