require('code_runner').setup({

  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    go = {
      "go run $fileName &&",
    },
    cpp = {
      "cd $dir &&",
      "echo $dir &&",
      "echo $fileName &&",
      "g++ $fileName -o $fileNameWithoutExt &&",
      "./$fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "ts-node",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
})
