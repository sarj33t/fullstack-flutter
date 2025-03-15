FROM dart:stable

WORKDIR /app

# Copy app source code to container directory
COPY . /app

# Verify the installation && install dependencies
RUN dart pub get

# Expose the necessary ports
EXPOSE 8080

CMD ["dart", "run", "bin/backend_api.dart", "--verbose"]