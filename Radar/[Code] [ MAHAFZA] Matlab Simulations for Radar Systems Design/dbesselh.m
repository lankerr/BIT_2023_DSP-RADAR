function [ res ] = dbesselh(nu,kind,z)
res=besselh(nu-1,kind,z)-besselh(nu,kind,z)*nu/z;