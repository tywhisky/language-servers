#!/bin/bash

echo "Build ElixirLS"
cd elixir-ls
echo "Running 'mix deps.get'..."
mix deps.get
echo "Running 'MIX_ENV=prod mix compile'..."
MIX_ENV=prod mix compile
echo "Running 'MIX_ENV=prod mix elixir_ls.release2'..."
MIX_ENV=prod mix elixir_ls.release2
echo "Build ElixirLS Successful!"

echo "Build typescript-language-server"
cd ../typescript-language-server
echo "Running yarn install"
yarn install
echo "Running yarn build"
yarn build
echo "Build typescript-language-server Successful!"

echo "All tasks completed!"
