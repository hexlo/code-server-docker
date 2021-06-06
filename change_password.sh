#!/bin/bash

OLD_HASHED_PASSWORD_LINE=$(grep 'hashed-password:\ ' .config/code-server/config.yaml)
NEW_PASSWORD=""

while [[ -z "${NEW_PASSWORD}" ]]; do
    read -r -s -p "Enter new password:"$'\n' new_passwd
    NEW_PASSWORD=${new_passwd}
done


NEW_HASHED_PASSWORD=$(printf "${NEW_PASSWORD}" | sha256sum | cut -d ' ' -f1)
NEW_HASHED_PASSWORD_LINE="hashed-password: $NEW_HASHED_PASSWORD"


sed -i "s/$OLD_HASHED_PASSWORD_LINE/$NEW_HASHED_PASSWORD_LINE/" .config/code-server/config.yaml
