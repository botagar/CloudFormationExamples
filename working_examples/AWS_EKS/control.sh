#!/bin/bash

usage()
{
    echo "usage: control.sh [[-a action ] [-p project name] [-e environment]] | [-h help]"
    echo "example: control.sh -a create -p eks-demo -e local"
}

validate_and_set_action()
{
    echo validating action $1
    case $1 in
        "create" | "destroy" )  action=$1 ;;
        * ) echo "Invalid action. Valid actions are [create|destroy]"
            exit 1
    esac
}

validate_and_set_project_name()
{
    echo validating project name $1
    case $1 in
        "" )    echo project name cannot be empty
                exit 1
                ;;
        * )     project=$1 ;;
    esac
}

validate_and_set_environment()
{
    echo validating environment $1
    case $1 in
        "" )    echo environment cannot be empty
                exit 1
                ;;
        * )     env=$1 ;;
    esac
}

action=notset
project=notset
env=notset

while [ "$1" != "" ]; do
    case $1 in
        -a | --action )         shift
                                validate_and_set_action $1
                                ;;
        -p | --project-name )   shift
                                validate_and_set_project_name $1
                                ;;
        -e | --environment )    shift
                                validate_and_set_environment $1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

case $action in
    "create" )
        echo Creating project $project in environment $env
        ansible-playbook ansible/master-create.yml -e project=$project -e env=$env --check
        ;;
    "destroy" )
        echo Destroying project $project in environment $env
        ansible-playbook ansible/master-destroy.yml -e project=$project -e env=$env --check
        ;;
    * )
        echo Unknown action
esac
