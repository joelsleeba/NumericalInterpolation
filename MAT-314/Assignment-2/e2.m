% x = [0, 0.25, 0.5, 0.75]
% y = [1, 1.64872, 2.71]
x = [1, 2, 3, -4, 5];
y = [2, 48, 272, 1182, 2262];
polynomial(x, y, -1)

function matrix = diff_matrix(x, y)
    matrix = zeros(length(y));
    matrix(:,1) = y;
    for j = 2:length(y)
        matrix([1:length(y)-j+1], j) = (matrix([1:length(y)-j+1],j-1) - matrix([2:length(y)-j+2],j-1)) ./ (x(1:length(y)-j+1)' - x(j:length(y))');
    end
end

function val = polynomial(x, y, inp)
    matrix = diff_matrix(x, y)
    matrix = matrix(1,:);
    val = 0;
    for i = 1:length(x);
        temp = 1;
        for j = 1:i-1
            temp = temp*(inp - x(j));
        end
        val = val + temp*matrix(i);
    end
end