# 1. Удаляем поврежденный объект из индекса
git rm --cached bootstrap/README.md

# 2. Удаляем поврежденный объект из .git/objects
rm -f .git/objects/9e/28185d58fb3b68289f64313c1a94b786d4f702

# 3. Пересоздаем индекс заново
rm -f .git/index
git add .

# 4. Создаем tree
TREE=$(git write-tree)
echo "Tree: $TREE"

# 5. Создаем коммит
COMMIT=$(echo "Aasm v2.4.1: fixed mini-NULL bug" | git commit-tree $TREE)
echo "Commit: $COMMIT"

# 6. Обновляем main
git update-ref refs/heads/main $COMMIT

# 7. Проверяем
git log --oneline -1
git status