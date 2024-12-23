# Usando a imagem oficial do Nginx como base
FROM nginx:alpine

# Copiar o arquivo HTML para o diretório de trabalho do Nginx
COPY index.html /usr/share/nginx/html/index.html

# Expor a porta 3000 em vez de 80
EXPOSE 3000

# Adicionar a configuração do Nginx para escutar na porta 3000
RUN sed -i 's/listen\s*80;/listen 3000;/' /etc/nginx/conf.d/default.conf

# O Nginx irá rodar automaticamente quando o container for iniciado
CMD ["nginx", "-g", "daemon off;"]


