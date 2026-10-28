import http.server
import socketserver

PORT = 8080
Handler = http.server.SimpleHTTPRequestHandler


class ReusableTCPServer(socketserver.TCPServer):
    # позволяет быстро перезапускать сервер без ошибки "Address already in use"
    allow_reuse_address = True


with ReusableTCPServer(("", PORT), Handler) as httpd:
    print(f"Сервер запущен на порту {PORT}")
    httpd.serve_forever()
