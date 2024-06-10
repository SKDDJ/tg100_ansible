#!/bin/bash
# pip install -U PyYAML ansible 
case $1 in
  install)
    ansible-playbook -i inventory setup-and-run-docker.yml --tags "install,docker_setup"
    ;;
  copy)
    ansible-playbook -i inventory setup-and-run-docker.yml --tags "copy_image"
    ;;
  load)
    ansible-playbook -i inventory setup-and-run-docker.yml --tags "load_image,tag_image"
    ;;
  run)
    ansible-playbook -i inventory setup-and-run-docker.yml --tags "run_container"
    ;;
  all)
    ansible-playbook -i inventory setup-and-run-docker.yml
    ;;
  *)
    echo "Usage: $0 {install|copy|load|run|all}"
    exit 1
    ;;
esac