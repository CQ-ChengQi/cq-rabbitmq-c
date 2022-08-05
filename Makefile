all : rabbitmq

.PHONY : clean cleanall

3rd/rabbitmq-c/build/librabbitmq/librabbitmq.a : 
	cd 3rd/rabbitmq-c && rm -rf build && mkdir build && cd build && cmake .. -DBUILD_EXAMPLES=ON && cmake --build .

rabbitmq : 3rd/rabbitmq-c/build/librabbitmq/librabbitmq.a


all : client

client : src/client.c
	gcc -o $@ $^ -I3rd/rabbitmq-c/include -I./3rd/rabbitmq-c/build/include  ./3rd/rabbitmq-c/build/librabbitmq/librabbitmq.a 

cleanall : 
	rm -rf client 3rd/rabbitmq-c/build

	
clean : 
	rm -rf client