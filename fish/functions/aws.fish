# Create a Fish function (preferred over alias for complex commands)
function aws
    docker run --rm -it \
        -v ~/.aws:/root/.aws \
        -v (pwd):/aws \
        public.ecr.aws/aws-cli/aws-cli $argv
end
