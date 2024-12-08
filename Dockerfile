# Usando a imagem oficial do Nginx como base
FROM nginx:alpine

# Copiar o arquivo HTML para o diretório de trabalho do Nginx
COPY index.html /usr/share/nginx/html/index.html

# Expor a porta 80, que é a porta padrão do Nginx
EXPOSE 80

# O Nginx irá rodar automaticamente quando o container for iniciado
CMD ["nginx", "-g", "daemon off;"]

