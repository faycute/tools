# AWS CLIのプロファイル（必須）
PROFILE=my-profile
# 対象のロググループの接頭辞（必須）
TARGET_LOG_GROUP_PREFIX="/aws/codebuild/target"
# 対象に含まれるロググループの中から除外したいロググループ名（任意）
EXCLUDE_LOG_GROUP_NAME="/aws/codebuild/target-exclude"