function b = dec2binvec(n, len)
% DEC2BINVEC: Converts a decimal integer into a binary vector
% DEC: Decimal integer e.g. 10
% N: The length of binary vector to generate
% B: Binary vector eg. [0 1 0 1], least->most significant bit
	b = fliplr(rem(floor(n*pow2(1-len:0)),2)==1);
end