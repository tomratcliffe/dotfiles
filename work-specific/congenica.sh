alias docker-login="aws sso login --profile sso-dev && aws ecr get-login-password --profile sso-dev | docker login --username AWS --password-stdin 144563655722.dkr.ecr.eu-west-1.amazonaws.com"

alias prs="gh pr list --search \"team-review-requested:Congenica/code-reviewers-frontend-web\""
