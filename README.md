# DEVELOPING WITH DOCKER
![image](https://github.com/teeseira/cfg-docker-app/assets/72232914/2c5adcfe-acb3-475d-af4e-1bcfe1cd2c70)

- In the space of 4 weeks I learned about the integration between development & operations, Docker commands & containers, and even how to push a Docker image to a repository. This is thanks to Code First Girls who organised the DevOps MOOC Sprint.
- This CFG Docker App shows a simple web app set up. All components are docker-based.

In this project I packaged files and code in a Docker container, so that it can be moved between environments reliably and safely.

## Prerequisites
- Install [Node.js](https://nodejs.org/en/download) on your computer.
- Download [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/) and log in.
- Download the **cfg-docker-app** files.

## Task 1: Setting Up
- Open terminal and navigate to the project directory (the cfg-docker-app folder).
- Run `cd app` to change to the working directory. The app folder is where my index and JavaScript server are located.
- Run `npm install http fs`. This uses the node package manager installed by node.js earlier to install two packages – the HTTP package and the fs package. The HTTP package allows me to work on the web.
  
  <img width = "400px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/fd5ae72c-0431-4564-97ce-0b4741789d41"/>

## Task 2: Create a Dockerfile
- Create a file named **Dockerfile** (without any file extension) in the project directory.
- Add the following content to the Dockerfile:
  
  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/54ba38d1-16f2-4023-9823-99aab2f8a8de"/>

  - The first command in my Dockerfile is a **FROM** instruction. This tells Docker to set the base image to Node.js version 13 on Alpine Linux, which is a lightweight Linux distribution. This is an existing Node.js container image that I found on Docker Hub.
- The instructions `RUN mkdir -p /home/app`and `WORKDIR /home/app` creates a **/home/app** directory in the Docker image and sets it as the working directory respectively.
- I use the **COPY** instruction to copy the contents of the **.app** directory on my host machine into the **/home/app** directory in the Docker image. This is going to bring all my application source for my simple Node.js app into the new container image.
- The **RUN** instruction runs an **npm install** inside the container. This is the node package manager that will install my Node.js application dependencies for me.
- **EXPOSE** the port the appication will run on which is port 3000.
- And finally, the CMD instruction sets the default command to run when the container starts. It will execute `node server.js` inside the **/home/app** directory.

## Task 3: Build the Docker Image

- Open a terminal and navigate to your project directory where the Dockerfile is located.
- Run the following command to build the Docker container image:
`docker build -t my_app_image .`

  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/03142f12-bc4d-46c6-8882-adba44bdbbe4"/>

- The output shows me the commands that are running inside the container and building the new image.

- Run `docker images` to see that the custom image my_app_image is created.
  
  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/75efb6b8-21f3-46f7-a4fd-8b433f819c7f"/>

## Task 4: Run the Docker Container
Once the image is built, I can run a container from it. My Node.js application is configured to listen on port 3000, so I run my docker run command to reflect this.

- Run the following command:
  
  `docker run -p 3000:3000 my_app_image`
  
  This will map port 3000 on my host machine to port 3000 inside the Docker container.
  
  <img width = "800px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/c7159312-eba7-48ea-958e-c015f3968bbf"/>

  
  My Node.js application should now be running inside the Docker container.

## Task 5: Access the application
I can now access it by visiting localhost:3000 in my browser.

- Visit localhost:3000 in the web browser to access the application running in the Docker container.
  <img width = "400px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/cd3bb0e9-fe21-4e07-bcb4-7884db9c5f03"/>


  A containerised version of the app has been successfully built. It's been built it into a Docker image and it can be put online.

## Task 6: Publish the Docker Image on Docker Hub

- Run the command: `docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]`. This command is often used when you want to push the same Docker image to a different repository or assign a different tag for versioning purposes.
  - **SOURCE_IMAGE[:TAG]** is the source image that I want to tag.
  - **TARGET_IMAGE[:TAG]** is the target image name and optional tag. It creates a new tag for the same image under a different repository or with a different tag.

- After tagging, you can use the **docker push** command to upload the image to a registry/repository.
- Then to push to your personal repository, enter: `docker push TARGET_IMAGE[:TAG]`

  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/e234fcc7-7680-400d-a038-83b3a11fc6b0"/>
  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/f09f5f60-3acc-4099-ada2-3f86d209668c"/>
  <img width = "700px" src = "https://github.com/teeseira/cfg-docker-app/assets/72232914/c838372a-1627-4cb8-8f6b-e498cf28afc3"/>

  The image is now shared on Docker Hub so that it can be easily downloaded and ran on any destination machine.

## Key Takeaways

- Defining the logic to start my server in the `server.js` file.
- Updating the Dockerfile and scripts to relect the `server.js` file as the entry point.
- Distinguishing the difference between the project directory and working directory.
