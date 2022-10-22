FRONT_MAKE=cd expense-tracker-frontend && $(MAKE)
BACK_MAKE=cd expense-tracker-backend && $(MAKE)

build:
	docker-compose build 

run:
	docker-compose -f docker-compose.yml up

stop:
	docker-compose -f docker-compose.yml down

clean-c-all:
	$(FRONT_MAKE) clean-c ; $(BACK_MAKE) clean-c-all

clean-i-all:
	$(FRONT_MAKE) clean-i ; $(BACK_MAKE) clean-i-all

clean-v-all:
	$(BACK_MAKE) clean-v-all

# remove all volumes including unused volumes in this project
clean-v-all-1:
	docker volume rm $(docker volume ls -q)

# frontend
# clean container 
clean-c-front:
	$(FRONT_MAKE) clean-c	

# clean image
clean-i-front:
	$(FRONT_MAKE) clean-i

# clean image forcefully
clean-if:
	$(FRONT_MAKE) clean-if

# clean all
clean-all-front:
	$(FRONT_MAKE) clean-all

# backend 
#create table
create-table:
	$(BACK_MAKE) create-table

# clean container 
clean-c-django:
	$(BACK_MAKE) clean-c-django 

clean-c-mongodb:
	$(BACK_MAKE) clean-c-mongodb

clean-c-redis:
	$(BACK_MAKE) clean-c-redis

clean-c-backend:
	$(BACK_MAKE) clean-c-all	

# clean image 
clean-i-django:
	$(BACK_MAKE) clean-i-django 

clean-i-redis:
	$(BACK_MAKE) clean-i-redis

clean-i-mongodb:
	$(BACK_MAKE) clean-i-mongodb

# clean image forcefully
clean-if-django:
	$(BACK_MAKE) clean-if-django 

clean-if-redis:
	$(BACK_MAKE) clean-if-redis

clean-if-mongodb:
	$(BACK_MAKE) clean-if-mongodb

clean-if-all:
	$(BACK_MAKE) clean-if-django ; $(BACK_MAKE) clean-if-mongodb ; $(BACK_MAKE) clean-if-redis

# clean all
clean-all-backend:
	$(BACK_MAKE) clean-all

#clean volume
clean-v-mongodb:
	$(BACK_MAKE) clean-v-mongodb

clean-v-redis:
	$(BACK_MAKE) clean-v-redis

clean-v-all-backend:
	$(BACK_MAKE) clean-v-all


