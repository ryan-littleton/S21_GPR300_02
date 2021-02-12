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
	
	passTangentBasis_transform_vs4x.glsl
	Calculate and pass tangent basis.
*/

// Modified by Ryan Littleton

#version 450

// ****TO-DO: 
//	-> declare matrices
//		(hint: not MVP this time, made up of multiple; see render code)
//	-> transform input position correctly, assign to output
//		(hint: this may be done in one or more steps)
//	-> declare attributes for lighting and shading
//		(hint: normal and texture coordinate locations are 2 and 8)
//	-> declare additional matrix for transforming normal
//	-> declare varyings for lighting and shading
//	-> calculate final normal and assign to varying
//	-> assign texture coordinate to varying

layout (location = 0) in vec4 aPosition;
layout (location = 2) in vec4 aNormal; //  Location from line 33
layout (location = 8) in vec2 aTexcoord; // uv

flat out int vVertexID;
flat out int vInstanceID;

out vec4 vNormal; 
out vec4 vPosition;
out vec2 vTexcoord;

uniform mat4 uMV, uMV_nrm, uP;

void main()
{
	// DUMMY OUTPUT: directly assign input position to output position
	//gl_Position = aPosition;

	//vPosition = aPosition; // object space
	//vNormal = aNormal; // object space
	vPosition = uMV * aPosition; // camera space
	vNormal = uMV_nrm * aNormal; // camera space, make sure to use nrm version

	vTexcoord = aTexcoord;

	gl_Position = uP * vPosition; // clip space, position is the only thing that has to be clip

	vVertexID = gl_VertexID;
	vInstanceID = gl_InstanceID;
}
