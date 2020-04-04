package db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import domain.Person;
import domain.PersonInfo;
import domain.Role;

public class PersonRepositoryStub implements PersonRepository {
	private Map<String, Person> persons = new HashMap<String, Person>();
	private Map<String, PersonInfo> personsInfo = new HashMap<>();
	
	public PersonRepositoryStub () {
		Person administrator = new Person("bib@ucll.be", "t", "Bib", "Liothekaris", Role.BIB);
		add(administrator);
		Person jan = new Person("jan@ucll.be", "t", "Jan", "Janssens", Role.LID);
		add(jan);
		Person an = new Person("an@ucll.be", "t", "An", "Cornelissen", Role.LID);
		add(an);
		Person elke = new Person("elke@ucll.be", "t", "Elke", "Steegmans", Role.LID);
		add(elke);
		PersonInfo janIn = new PersonInfo(jan.getUserId());
		personsInfo.put(jan.getUserId(),janIn);
		PersonInfo anIn = new PersonInfo(an.getUserId());
		personsInfo.put(an.getUserId(),anIn);
		PersonInfo elkeIn = new PersonInfo(elke.getUserId());
		personsInfo.put(elke.getUserId(),elkeIn);
		janIn.addFriend(an);
		janIn.addFriend(elke);
		anIn.addFriend(jan);
	}
	
	public Person get(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		return persons.get(personId);
	}

	public PersonInfo getPersonInfo(String personId)
	{
		return personsInfo.get(personId);
	}
	
	public List<Person> getAll(){
		return new ArrayList<Person>(persons.values());	
	}

	public List<PersonInfo> getAllPersonInfo()
	{
		return new ArrayList<PersonInfo>(personsInfo.values());
	}

	public void setStatus(String personId, String status, String other) {
		personsInfo.get(personId).setStatus(status);
		personsInfo.get(personId).setOtherText(other);
	}

	public void add(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		if (persons.containsKey(person.getUserId())) {
			throw new IllegalArgumentException("User already exists");
		}
		persons.put(person.getUserId(), person);
		PersonInfo pi = new PersonInfo(person.getUserId());
		personsInfo.put(person.getUserId(), pi);
	}
	
	public void update(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		persons.put(person.getUserId(), person);
	}
	
	public void delete(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		persons.remove(personId);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		Person person = get(email);
		
		if (person != null && person.isCorrectPassword(password)) {
			return person;
		}
		else {
			return null;
		}
	}
}
