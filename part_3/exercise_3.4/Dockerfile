# Use a base image
FROM docker:latest


# Copy the script into the container
COPY ./script.sh /usr/local/bin/script.sh

# Make the script executable
RUN chmod +x /usr/local/bin/script.sh

# Define the entry point
ENTRYPOINT ["/bin/sh","/usr/local/bin/script.sh"]

# Define default CMD arguments
CMD ["haaaaron/express_app", "haaaaron/testing"]