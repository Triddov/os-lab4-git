FROM python:3.11-alpine

# вывод print() сразу попадает в docker logs, .pyc не создаются
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# приложение работает от непривилегированного пользователя
RUN addgroup -S app && adduser -S -G app app

COPY --chown=app:app server.py /app/

USER app

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1

CMD ["python3", "server.py"]
