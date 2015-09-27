#include<iostream>
int main()
{
	double x,y,w,h;
	std::cout<<"Enter x,y,w,h (they must be positive): ";
	std::cin>>x>>y>>w>>h;
	int i=0;
	int n;
	double s;
	double arr[10];
	n = ((int)(x/w)) * ((int)(y/h));
	for( int q=0 ; i<10 && q<(int)(x/w) ; i++,q++ )
	{
		arr[i]=(q+1)*((int)w);
		if(arr[i]==x) break;
	}
	s = y - (((int)(y/h))*h);
	n += ((int)(s/w)) * ((int)(x/h));
	for( int q=0 ; i<10 && q<(int)(x/h) ; i++,q++ )
	{
		arr[i]=(q+1)*((int)h);
		if(arr[i]==x) break;
	}
	std::cout<<n<<" plates"<<std::endl;
	for(int q=0;q<i;q++) std::cout<<arr[q]<<' ';
	std::cout<<std::endl;
	return 0;
}
