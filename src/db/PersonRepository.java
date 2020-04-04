package db;

import java.util.List;

import domain.Person;
import domain.PersonInfo;

public interface PersonRepository {

	public abstract void add(Person person);

	public abstract void delete(String userId);

	public abstract Person get(String userId);

	public abstract List<Person> getAll();
	
	public abstract Person getAuthenticatedUser(String email, String password);

	public abstract void update(Person person);

	public abstract PersonInfo getPersonInfo(String personId);

	public abstract List<PersonInfo> getAllPersonInfo();

	public abstract void setStatus(String personId, String status, String other);

}