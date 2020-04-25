declare -A TARGET_ENVIRONMENTS
# 対象の環境（必須）
# 左辺に環境名（任意の文字列）、右辺にチェック対象のURLを記述
TARGET_ENVIRONMENTS=(
  ["google"]="https://google.com"
  ["yahoo"]="https://yahoo.co.jp"
)
# インターバル秒数（必須）
INTERVAL_SECONDS=0.5