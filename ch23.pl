:- set_prolog_flag(double_quotes, chars).
:- use_module(library(charsio)).
:- use_module(library(crypto)).

% ?- atom_chars(κρυπτός, Cs).
% Cs = [κ, ρ, υ, π, τ, ό, ς].

% ?- hex_bytes("501ACx

% ?- crypto_n_random_bytes(32, Bs),
% |    hex_bytes(Key, Bs).
% Bs = [2, 126, 229, 121, 55, 51, 239, 43, 28|...],
% Key = '027ee5793733ef2b1ca30b5328db26379f3c9cdc9d80f2337a9e3cd8062fc274'.

% ?- crypto_data_hash("Hello world!", Hash, [algorithm(blake2s256)]).
% Hash = c63813a8f804abece06213a46acd04a2d738c8e7a58fbf94bfe066a9c7f89197.

% ?- crypto_data_hash("Hello world!", Hash, [algorithm(blake2s256)]).
% Hash = c63813a8f804abece06213a46acd04a2d738c8e7a58fbf94bfe066a9c7f89197.

% ?- crypto_data_hash("Hello world!", Hash, [algorithm(blake2s256)]),
% |    hex_bytes(Hash, Bs).
% Hash = c63813a8f804abece06213a46acd04a2d738c8e7a58fbf94bfe066a9c7f89197,
% Bs = [198, 56, 19, 168, 248, 4, 171, 236, 224|...].

% ?- crypto_data_hash("Hello world!", Hash, [algorithm(A)]).
% Hash = c0535e4be2b79ffd93291305436bf889314e4a3faec05ecffcbb7df31ad9e51a,
% A = sha256.

% ?- crypto_password_hash("password", Hash).
% Hash = '$pbkdf2-sha512$t=131072$5g2NQVus/NE+KhCxmCW1AQ$OLeRtW99dDNGF/G4rqdsEKaHfybPuFPJhhG9uv3U7BDmgi5hUxOAA/kTWStzjpLihdb+KFQFskxCc1L6qR9Lgw'.

% ?- crypto_password_hash("password", Hash).
% Hash = '$pbkdf2-sha512$t=131072$UCqf9VZpWk0ozjHW0f7J+A$chOxAkX620U0PqonNf7zlMW6Xf6sQOHUOij0sQRhzvsFAE9GLoCTPMYQSGGEGx4ue6fajfk9a+xHy2jGDmizKA'.

% ?- crypto_password_hash("password", Hash),
% |    crypto_password_hash("password", Hash).
% Hash = '$pbkdf2-sha512$t=131072$B24sqcDhZoLp53N2NeHGwQ$SL/DMOP+bScUn+C/pzVon9Sj56mEz8hHFKclB81O9IQoIos69oy+22w/SonIwlCRGhqVJO8mlPyivralgFF0og'.

% ?- crypto_password_hash("password", Hash),
% |    crypto_password_hash("meh", Hash).
% false.

% ?- crypto_n_random_bytes(32, Key),
% |    crypto_n_random_bytes(12, IV),
% |    crypto_data_encrypt("hello world", 'chacha20-poly1305', Key, IV, CipherText, [tag(Tag)]).
% Key = [84, 193, 211, 82, 33, 123, 85, 19, 212|...],
% IV = [113, 170, 88, 241, 235, 253, 68, 248, 138|...],
% CipherText = "\u0019\u0081e d\u0001()@Ó\u000E",
% Tag = [116, 73, 75, 174, 193, 199, 47, 218, 119|...].

% ?- crypto_n_random_bytes(32, Key), 
% |    crypto_n_random_bytes(12, IV), 
% |    crypto_data_encrypt("hello world", 'chacha20-poly1305', Key, IV, CipherText, [tag(Tag)]),
% |    crypto_data_decrypt(CipherText, 'chacha20-poly1305', Key, IV, RecoveredText, [tag(Tag)]).
% Key = [174, 163, 88, 237, 84, 165, 152, 229, 182|...],
% IV = [18, 2, 165, 107, 11, 2, 77, 148, 226|...],
% CipherText = "åVëbÓ\u0083zDçâÈ",
% Tag = [25, 238, 82, 21, 168, 27, 161, 113, 223|...],
% RecoveredText = "hello world".