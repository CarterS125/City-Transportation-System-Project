package com.solvd.citytransportationsystemproject.models;

import java.util.Objects;

public class Station extends Model {
    private String name;
    private String type;
    private String address;
    private long routeId;
    
    public Station() {
		super();
	}

	public Station(long id, String name, String type, String address, long routeId) {
        super(id);
        this.name = name;
        this.type = type;
        this.address = address;
        this.routeId = routeId;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getRouteId() {
		return routeId;
	}

	public void setRouteId(long routeId) {
		this.routeId = routeId;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this)
			return true;
		if (!(obj instanceof Station))
			return false;
		Station station = (Station) obj;
		return Objects.equals(name, station.name) &&
				Objects.equals(type, station.type) &&
				Objects.equals(address, station.address) &&
				routeId == station.routeId;
	}


	@Override
	public int hashCode() {
		return Objects.hash(name, type, address, routeId);
	}


}
