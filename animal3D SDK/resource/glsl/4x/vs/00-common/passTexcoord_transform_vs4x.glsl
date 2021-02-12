/*
	Copyright 2011-2021 Daniel S. Buckstein

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

/*
	animal3D SDK: Minimal 3D Animation Framework
	By Daniel S. Buckstein
	
	passTexcoord_transform_vs4x.glsl
	Calculate final position and pass atlas texture coordinate.
*/

// Modified by Ryan Littleton


#version 450

// ****TO-DO: 
//	-> start with same items as "../passthru_transform_vs4x"
//	-> declare texture coordinate attribute
//		(hint: location is 8, use most appropriate type)
//	-> declare texture coordinate varying
//	-> assign attribute to varying

// For attributes, the name doesn't matter, location does.
layout (location = 0) in vec4 aPosition;
layout (location = 8) in vec2 aTexcoord; // uv

// Unifrom names matter.
uniform mat4 uMVP; // model-view-projection matrix

flat out int vVertexID;
flat out int vInstanceID;
out vec2 vTexcoord;

//varying vec2 vTexcoord; old way don't do

void main()
{
	// DUMMY OUTPUT: directly assign input position to output position
	gl_Position = aPosition;

	vTexcoord = aTexcoord; // assign texcoord to varying to be read on a per fragment basis

	vVertexID = gl_VertexID;
	vInstanceID = gl_InstanceID;
}
