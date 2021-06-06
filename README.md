### Template for code-server instance
1. export UID and GID before running the container
`export UID && export GID`

2. Replace the default hashed password. Generate the hashed password:
```
printf "your_password" | sha256sum | cut -d' ' -f1
```
