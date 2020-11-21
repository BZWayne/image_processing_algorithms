function [output] = digitrec(input)    
    input=logical(rgb2gray(input));
    [height, width] = size(input);
    bound=~edge(imdilate(imerode((input),strel('square',3)),strel('square',3)));
    bound=(imdilate(imerode((bound),strel('square',2)),strel('square',2)));
    totpixel=sum(sum(~bound));
    chain=zeros(1,totpixel);
    test=bound;
    iteration=true(height, width);
    i_start=0;
    j_start=0;
    for k=1:totpixel+1
      link=1;
      for i=1:height
       for j=1:width
           if link
              
           if test(i,j)==0 &&  k==1
            if test(i,j+1)==0
                chain(k)=0;link=0;iteration(i,j+1)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i-1,j+1)==0
                chain(k)=1;link=0;iteration(i-1,j+1)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i-1,j)==0
                chain(k)=2;link=0;iteration(i-1,j)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i-1,j-1)==0
                chain(k)=3;link=0;iteration(i-1,j-1)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i,j-1)==0
                chain(k)=4;link=0;iteration(i,j-1)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i+1,j-1)==0
                chain(k)=5;link=0;iteration(i+1,j-1)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i+1,j)==0
                chain(k)=6;link=0;iteration(i+1,j)=0;test(i,j)=1;i_start=i;j_start=j;
            elseif test(i+1,j+1)==0
                chain(k)=7;link=0;iteration(i+1,j+1)=0;test(i,j)=1;i_start=i;j_start=j;
            end
            
           elseif test(i,j)==0 && iteration(i,j)==0
               
            if test(i,j+1)==0 || (i_start==i && j_start==j+1)
                chain(k)=0;link=0;iteration(i,j+1)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i-1,j+1)==0 || (i_start==i-1 && j_start==j+1)
                chain(k)=1;link=0;iteration(i-1,j+1)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i-1,j)==0 || (i_start==i-1 && j_start==j)
                chain(k)=2;link=0;iteration(i-1,j)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i-1,j-1)==0 || (i_start==i-1 && j_start==j-1)
                chain(k)=3;link=0;iteration(i-1,j-1)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i,j-1)==0 || (i_start==i && j_start==j-1)
                chain(k)=4;link=0;iteration(i,j-1)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i+1,j-1)==0 || (i_start==i+1 && j_start==j-1)
                chain(k)=5;link=0;iteration(i+1,j-1)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i+1,j)==0 || (i_start==i+1 && j_start==j)
                chain(k)=6;link=0;iteration(i+1,j)=0;test(i,j)=1;%iteration(i,j)=1;
            elseif test(i+1,j+1)==0 || (i_start==i+1 && j_start==j+1)
                chain(k)=7;link=0;iteration(i+1,j+1)=0;test(i,j)=1;%iteration(i,j)=1;
            end
            
           end
           
           end
       end
      end
    end
    
    chains;

    switch(length(chain))
        case length(zero_48) %417
            if chain== zero_48
                 output=0;
            end
        case length(zero_48_b) %387
            if chain== zero_48_b
                output=0;
            end
        case length(zero_48_bi) %384
            if chain== zero_48_bi
                output=0;
            elseif chain==one_72_bi
                output=1;
            end
        case length(zero_48_i) %414
            if chain== zero_48_i
                output=0;
            end
        case length(zero_72) %627
            if chain== zero_72
                output=0;
            end
        case length(zero_72_b) %572
            if chain== zero_72_b
                output=0;
            end
        case length(zero_72_bi) %573
            if chain== zero_72_bi
                output=0;                           
            end
        case length(zero_72_i) %620
            if chain==zero_72_i
                output=0;
            elseif chain==eight_72_b
                output=8;
            elseif chain==nine_72_b
                output=9;
            end
        case length(one_48) %235
            if chain==one_48
                output=1;
            end
        case length(one_48_b) %251
            if chain==one_48_b
                output=1;
            end
        case length(one_48_bi) %256
            if chain==one_48_bi
                output=1;
            end
        case length(one_48_i) %246
            if chain==one_48_bi
                output=1;
            end
        case length(one_72) %359
            if chain==one_72
                output=1;
            end
        case length(one_72_b) %380
            if chain==one_72_b
                output=1;
            elseif chain==two_48
                output=2;             
            end
        case length(one_72_i) %370
            if chain==one_72_i
                output=1;
            end
        case length(two_48_b) %362
            if chain==two_48_b
                output=2;
            end
        case length(two_48_bi) %346
            if chain==two_48_bi
                output=2;
            end
        case length(two_48_i) %372
            if chain==two_48_i
                output=2;
            end
        case length(two_72) %577
            if chain==two_72
                output=2;
            end
        case length(two_72_b) %549
            if chain==two_72_b
                output=2;
            end
        case length(two_72_bi) %523
            if chain==two_72_bi
                output=2;
            end
        case length(two_72_i) %558
            if chain==two_72_i
                output=2;
            end
        case length(three_48)%394
            if chain==three_48
                output=3;
            end
        case length(three_48_b)%373
            if chain==three_48_b
                output=3;
            end
        case length(three_48_bi)%354
            if chain==three_48_bi
                output=3;
            end
        case length(three_48_i)%386
            if chain==three_48_i
                output=3;
            end
        case length(three_72)%602
            if chain==three_72
                output=3;
            end
        case length(three_72_b)%563
            if chain==three_72_b
                output=3;
            end
        case length(three_72_bi)%548
            if chain==three_72_bi
                output=3;
            end
        case length(three_72_i)%583
            if chain==three_72_i
                output=3;
            end
        case length(four_48)%364
            if chain==four_48
                output=4;
            end
        case length(four_48_b)%339
            if chain==four_48_b
                output=4;
            end
        case length(four_48_bi)%328
            if chain==four_48_bi
                output=4;
            end
        case length(four_48_i)%350
            if chain==four_48_i
                output=4;
            end
        case length(four_72)%551
            if chain==four_72
                output=4;
            end
        case length(four_72_b)%522
            if chain==four_72_b
                output=4;
            end
        case length(four_72_bi)%509
            if chain==four_72_bi
                output=4;
            end
        case length(four_72_i)%540
            if chain==four_72_i
                output=4;
            end
        case length(five_48)%433
            if chain==five_48
                output=5;
            end
        case length(five_48_b)%406
            if chain==five_48_b
                output=5;
            end
        case length(five_48_bi)%400
            if chain==five_48_bi
                output=5;
            elseif chain==six_48_bi
                output=6;
            end
        case length(five_48_i)%422
            if chain==five_48_i
                output=5;
            end
        case length(five_72)%657
            if chain==five_72
                output=5;
            end
        case length(five_72_b)%614
            if chain==five_72_b
                output=5;
            end
        case length(five_72_bi)%603
            if chain==five_72_bi
                output=5;
            end
        case length(five_72_i)%644
            if chain==five_72_i
                output=5;
            end
        case length(six_48)%459
            if chain==six_48
                output=6;
            elseif chain==eight_48
                output=8;
            end
        case length(six_48_b)%411
            if chain==six_48_b
                output=6;
            end
        case length(six_48_i)%438
            if chain==six_48_i
                output=6;
            elseif chain==seven_72_b
                output=7;
            elseif chain==nine_48_i
                output=9;
            end
        case length(six_72)%690
            if chain==six_72
                output=6;
            end
        case length(six_72_b)%622
            if chain==six_72_b
                output=6;
            end
        case length(six_72_bi)%604
            if chain==six_72_bi
                output=6;
            end
        case length(six_72_i)%668
            if chain==six_72_i
                output=6;
            end
        case length(seven_48)%290
            if chain==seven_48
                output=7;
            elseif chain==seven_48_bi
                output=7;
            end
        case length(seven_48_b)%288
            if chain==seven_48_b
                output=7;
            end
        case length(seven_48_i)%287
            if chain==seven_48_i
                output=7;
            end
        case length(seven_72)%435
            if chain==seven_72
                output=7;
            elseif chain==seven_72_bi
                output=7;
            end
        case length(seven_72_i)%434
            if chain==seven_72_i
                output=7;
            end
        case length(eight_48_b)%407
            if chain==eight_48_b
                output=8;
            elseif chain==nine_48_b
                output=9;
            end
        case length(eight_48_bi)%397
            if chain==eight_48_bi
                output=8;
            end
        case length(eight_48_i)%458
            if chain==eight_48_i
                output=8;
            end
        case length(eight_72)%702
            if chain==eight_72
                output=8;
            end
        case length(eight_72_bi)%610
            if chain==eight_72_bi
                output=8;
            end
        case length(eight_72_i)%692
            if chain==eight_72_i
                output=8;
            end
        case length(nine_48)%456
            if chain==nine_48
                output=9;
            end
        case length(nine_48_bi)%396
            if chain==nine_48_bi
                output=9;
            end
        case length(nine_72)%684
            if chain==nine_72
                output=9;
            end
        case length(nine_72_bi)%600
            if chain==nine_72_bi
                output=9;
            end
        case length(nine_72_i)%663
            if chain==nine_72_i
                output=9;
            end
        otherwise
            output="Image not recognised";
    end
    
end


  

