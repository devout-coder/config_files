require('code_runner').setup({

  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    cpp = {
      "cd $dir &&",
      "g++ $fileName &&",
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
