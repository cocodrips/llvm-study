set -ex
docker build -f Dockerfile.llvmlite -t llvm-lite .
docker run -it --rm -v $PWD/front:/front llvm-lite python main.py
docker build -f Dockerfile.runtime -t llvm-runtime .
docker run -it --rm llvm-runtime ./run_main
