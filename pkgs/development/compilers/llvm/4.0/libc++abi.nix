{ stdenv, cmake, fetch, libcxx, libunwind, llvm, version }:

stdenv.mkDerivation {
  name = "libc++abi-${version}";

  src = fetch "libcxxabi" "09hlqlbxpnqi3449nrk43khp4jgd34xwx406mw6igwl8a673pa85";

  buildInputs = [ cmake llvm ] ++ stdenv.lib.optional (!stdenv.isDarwin && !stdenv.isFreeBSD) libunwind;

  postUnpack = ''
    unpackFile ${libcxx.src}
    export cmakeFlags="-DLIBCXXABI_LIBCXX_PATH=$PWD/$(ls -d libcxx-*)"
  '' + stdenv.lib.optionalString stdenv.isDarwin ''
    export TRIPLE=x86_64-apple-darwin
  '';

  installPhase = if stdenv.isDarwin
    then ''
      for file in lib/*.dylib; do
        # this should be done in CMake, but having trouble figuring out
        # the magic combination of necessary CMake variables
        # if you fancy a try, take a look at
        # http://www.cmake.org/Wiki/CMake_RPATH_handling
        install_name_tool -id $out/$file $file
      done
      make install
      install -d 755 $out/include
      install -m 644 ../include/*.h $out/include
    ''
    else ''
      install -d -m 755 $out/include $out/lib
      install -m 644 lib/libc++abi.so.1.0 $out/lib
      install -m 644 ../include/cxxabi.h $out/include
      ln -s libc++abi.so.1.0 $out/lib/libc++abi.so
      ln -s libc++abi.so.1.0 $out/lib/libc++abi.so.1
    '';

  meta = {
    homepage = http://libcxxabi.llvm.org/;
    description = "A new implementation of low level support for a standard C++ library";
    license = with stdenv.lib.licenses; [ ncsa mit ];
    maintainers = with stdenv.lib.maintainers; [ vlstill ];
    platforms = stdenv.lib.platforms.unix;
  };
}
