# Stage 1: Build the MkDocs site
FROM python:3.9-alpine as builder

# Install MkDocs and MkDocs Material
RUN pip install mkdocs mkdocs-material

# Set the working directory
WORKDIR /site

# Copy MkDocs configuration and docs
COPY ./documents /site/docs
COPY ./mkdocs.yml /site/mkdocs.yml

# Build the MkDocs site
RUN mkdocs build

# Stage 2: Set up the Caddy server
FROM caddy:2.7.6-alpine

ARG SITE_URL
ENV SITE_URL=${SITE_URL}

# Copy the built site from the builder stage
COPY --from=builder /site/site /usr/share/caddy/site

# Create a Caddyfile
RUN printf ":8000 {\n\troot * /usr/share/caddy/site\n\tfile_server\n}" > /etc/caddy/Caddyfile

# Expose port 8000
EXPOSE 8000

# Set the command to run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
